class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cd048d6bc1605a04886baa248cbed94a30f37083e6cceb220ba5babc60ae25b5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fdd377e8065f076f209b3869a3f77ed987f5eb84d6f1de3831cc25cdfddf390f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2836341ca5a82d46d8c6eb7603e3e087dd44e1dc5daefc468853fba24fb77620" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.140+e078324db.tar.xz"
  version "0.12.0-dev.140+e078324db"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
