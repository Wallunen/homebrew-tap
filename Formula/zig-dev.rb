class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b95b031e88f04d6446b465dbb5bd5211e8ab9bf950dc44ab6d9ddbe49bc4b4e5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "89a476e77955fd796c794418a4c6c317a621f73a5a99cc41f0f7ebe18515907a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ed254c1d8ca0bd66942d6167ee7a4d0bc286e6276e0e2405ef85c6917e94c310" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1971+5a12d0070.tar.xz"
  version "0.11.0-dev.1971+5a12d0070"
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
