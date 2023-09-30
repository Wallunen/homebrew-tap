class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c7202071b6142604cf17e8290fbf9a647d47603b0588d9e18aa544ed8e309dfd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ba6dff08d91cc5b718dab97a237a91b23987a64800e4535285f941661d5357b5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ec6d3a61de6eb3efa618dd04e68200926e41797d5bde57f36723e7f78b87fd1f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.669+e919fbea9.tar.xz"
  version "0.12.0-dev.669+e919fbea9"
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
